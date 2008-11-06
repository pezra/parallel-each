require 'pathname'
require Pathname(__FILE__).dirname + './bounded_async_task_runner'

module Enumerable
  def p_each(max_tasks=20, &block)
    runner = BoundedAsyncTaskRunner.new(max_tasks)

    each do |item|
      runner.do(item, &block)
    end

    runnder.wait_for_all_to_finish
  end
end
