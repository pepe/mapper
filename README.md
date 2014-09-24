# Simple Mapper

Implementation of the simple mapper mechanism.

The main mapper class is documented. Usage can be seen in the spec. The most
important thing is the mapping, which is hash with simple tree describing how
attributes are mapped to the class.

It is complete happy path through the problem, any deviation in the input or
the mapping will probably raise an exception.

Clone it:

`git clone https://github.com/pepe/mapper`

Get into directory and install bundle.

`cd mapper`

`bundle install`

Run the specs:

`rspec spec`

