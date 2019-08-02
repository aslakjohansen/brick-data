# brick-data - Brick Extension for Linking Data

This includes:

- Building Properties
- sMAP streams

# Blueprint

- `data:feeds` src=data:Data dst=data:Data
- `data:Data`
  - has properties:
    - unit
    - modality
    - media (substance)
    - encoding
    - range or mapping
  - subclassed into
    - `data:StaticData`
    - `data:CSVData`
    - `data:SmapData`
    - `data:BosswaveData`
    - `data:KafkaData`
    - `data:MqttData`
    - `data:KnxData`
    - `data:OpcUaData`

# TODO:

-  In [brick-data](src/brick-data) hould `RDF.type` be replaced by `RDFS.subClassOf`?
