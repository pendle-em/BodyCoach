# The Body Coach Task

* I have put the cells in a scrollable `HStack` when `dynamicTypeSize > .large` to ensure the design caters for large text. This is not a perfect solution as the cells still do not cater well for steps over 99,999 with default text size, but this is an edge case as most people are unlikely to be doing this many steps in one day anyway. I have also only tested this on a iPhone 15 Pro simulator. If I had more time I would look into this more.
* Requesting permissions from HealthKit seems to take a very long time. I'm unsure if this is expected, or due to my laptop being slow, or some other reason.
* I would add more tests if I had more time.

Thank you for taking the time to review my test!
