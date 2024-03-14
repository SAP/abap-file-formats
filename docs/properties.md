## Translation Files in ABAP File Formats

### File Format
The file format for translation is `properties` and consists of key value pairs, e.g.
```PROPERTIES
key=value
...
```
The `key` refers to the text that is translated (source language), whereas `value` is the actual translated text.
A key follows the convenction of [JSONPath](https://goessner.net/articles/JsonPath/) when refering to data in JSON files.

### File Name

The translation of an ABAP object are stored in file named
`<object_name>.<object_type>.i18n.<language>.properties`

### Example
Assume that the ABAP object is represented by
```JSON
{
  "formatVersion": "1",
  "header": {
    "description": "Hello",
    "originalLanguage": "en"
  },
  "descriptions": {
    "methods": [
      {
        "name": "METHOD_ONE",
        "description": "One",
      },
      {
        "name": "METHOD_TWO",
        "description": "Two",
      }
    ]
  }
}
```
with the translation relevant texts being all descriptions.
Then the translation file (for french) is
```PROPERTIES
$.header.description=Bonjour
$.descriptions.methods[?(@.name=='METHOD_ONE')].description=Un
$.descriptions.methods[?(@.name=='METHOD_TWO')].description=Deux
```
