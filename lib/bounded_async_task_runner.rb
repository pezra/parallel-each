class AsyncTaskError < Exception
  attr_reader :cause
  
  def initialize(exception)
    @cause = exception
    super("Worker error: #{cause.message} (#{cause.class.name})")
  end
end


class BoundedAsyncTaskRunner
  attr_reader :max_workers

  # Create a new BoundedAsyncTaskRunner.
  #
  # @param [Integer] max_workers the maximum number of asynchronous
  #   tasks to simultaneously execute.
  def initialize(max_workers=20)
    @threads = Array.new
    @max_workers = max_workers
  end

  # Execute the provided block asynchronously.  
  #
  # @param *args Objects to yield to the provided block when it is
  #   invoked.
  #
  # @yield The task to execute asynchronously.
  #
  # @yieldparam *args The arguments passed into this method.
  #
  # @raise AsyncTaskError If any previously executed task has failed
  #   (i.e. raised an error) an AsyncTaskError will be raised instead
  #   of executing the async task.
  def do(*args, &block)
    purge_dead
    until @threads.size < max_workers
      purge_dead
      break if @threads.size < max_workers
      # We have still have the maximum number of active threads so we
      # need to wait for one to finish.

      @threads.first.join(0.1)  # Join on the oldest thread because it will probably finish first.
    end
    # We can start new thread without exceeding the threshold

    thread_args = [block] + args

    @threads << Thread.start([block] + args) do |args|
      task = args.shift
      
      begin
        task.call(*args)
      rescue Exception => e
        AsyncTaskError.new(e)
      end
    end
  end
  alias :do_async :do


  # Blocks until all currently running tasks to complete.
  #
  # @raise AsyncTaskError If any previously executed task has failed
  #   (i.e. raised an error) an AsyncTaskError will be raised.
  def wait_for_all_to_finish
    until @threads.empty?
      @threads.first.join
      purge_dead
    end    
  end

  private
  def purge_dead
    @threads.each do |t|
      next if t.alive?  # ignore the alive ones
      
      if t.value.kind_of?(AsyncTaskError)
        raise(t.value)
      else
        @threads.delete(t)
      end
    end
  end

end
