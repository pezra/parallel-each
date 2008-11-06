= paralleleach

* http://github.com/pezra/parallel_each

== DESCRIPTION:

This is a set of Enumerable like methods that perform the blocks in parallel.  

== FEATURES/PROBLEMS:

* FIX (list of features or problems)

== SYNOPSIS:

    require 'rubygems'
    require 'parallel_each'

    (1..1000).p_each(15) do |i| 
      # do something with i
    end

This is much like Enumerable#each except that the block would be
executed in 15 different threads simultaneously.  On the green
threaded MRI this can result in significant performance gains if the
block is IO bound.  On native thread implementation the gains might be
significant for CPU bound operations.

== REQUIREMENTS:


== INSTALL:

* sudo gem install parallel_each

== LICENSE:

(The MIT License)

Copyright (c) 2008 Peter Williams

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
