Parallel Each
=============

Parallel each allows you to iterated through any `Enumerable` handling
the items in parallel.  

    results = []
    [1,2,3,4].p_each do |i|
      results << i
    end
    results   # => [3,2,4,1]

The parallel processing happens in threads The given block is executed
for each item in the array in a separate thread.  Obviously, this
could get dodgy for large `Enumerable`s.  To handle that `#p_each`
will never have more than a set number of threads running
simultaneously.  The default limit is 20 but you can change that by
passing a number to `#p_each`.

    results = []
    [1,2,3,4].p_each(2) do |i|
      sleep 1
      results << i
    end
    results   # => [2,1,3,4]
    

Parallel iterates through the items in order getting ahead of what can
be processed immediately.  This mean that you can use `#p_each` on
very large lazy loaded lists (such as the results of
`ActiveRecord#find`) without instantiating every item in the list at
once.

Performance
-----------

The performance characteristics of parallel iteration varies greatly
depending on the platform and work being performed.

I/O bound work is where `#p_each` will really shine.  In this
situation the overall processing time will, generally, be improved
regardless of the version/flavor of Ruby that is being used or the
number of CPUs.

If the work is CPU bound the impacts of parallelization will depend on
version/flavor of Ruby and the number of CPUs.  With more than one CPU
running Ruby 1.9 or JRuby should result in an improvement of the
overall processing time.  With one CPU or when running Ruby 1.8 there
will be no improvement (and possibly a slight degradation) of the
overall processing time.


Copyright 2009 Peter Williams.

This Program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this program.  If not, see
<http://www.gnu.org/licenses/>.

