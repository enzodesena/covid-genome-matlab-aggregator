# covid-data-aggregator

* **step_1_add_latlong_to_dataset** - This step is **optional** and is only needed if you also want to add the latitude and longitude of the locality of individual sequences to the individual datasets. This uses Google Maps API's; if you don't have it already, you'll need to create your own account with Google at [Google Maps Platform](https://cloud.google.com/maps/official).
* **step_2_bundle_datasets** - This script reads the dataset folders and returns a struct array containing all the datasets. The datasets are returned in chronological order according to the collection data. If you only want to use the data that is already contained in this repository, this is the only step you need to run.
