# COVID-19 Data Aggregator


## Getting Started

These instructions will get you a copy of the project up and running on your  machine.

### Prerequisites

You need Matlab and the Bioinformatics Toolbox.

I only tested the code on Mac with Matlab2020a. I have no reason to believe it shouldn't run on earlier versions (albeit recent ones), but I won't provide support for any other platform.


### Installing

No need for installation. Clone/download and you are ready to go!


### Software

In order to avoid repetition of operations that are costly either in terms of computation or bandwidth, the software is divided into steps:

* **step_1_add_latlong_to_dataset** - This step is **optional** and is only needed if you also want to add the latitude and longitude of the locality of individual sequences to the individual datasets. This uses Google Maps API's; if you don't have it already, you'll need to create your own account with Google at [Google Maps Platform](https://cloud.google.com/maps/official).
* **step_2_bundle_datasets** - This script reads the dataset folders and returns a struct array containing all the datasets. The datasets are returned in chronological order according to the collection data. If you only want to use the data that is already contained in this repository, this is the only step you need to run.


If you use step 2 to access the data, everything will be indexed accordingly. So, for instance, the genomic sequence of the first measurement is `datasets(1).sequence`.

## Contributing

Pull requests are welcome.

## Authors

* **Enzo De Sena** - [desena.org](https://www.desena.org) (enzodesena AT gmail DOT com)

The project uses:
* **Joel Feenstra**'s *parse_json* [Mathworks File Exchange](https://mathworks.com/matlabcentral/fileexchange/20565-json-parser)


## License

This project is licensed under the MIT License. The data and the sofware are provided as they are without warranty of any kind (see [LICENSE.md](LICENSE.md) for details).
