## Translation Files in ABAP File Formats

### File Format
The file format for translation is `properties` and consists of key value pairs, e.g.
```PROPERTIES
key=value
...
```
The `key` refers to the text that is translated (source language), whereas `value` is the actual translated text.
Translation relevant text, that is stored in a JSON file, is referenced by [JSONPath](https://goessner.net/articles/JsonPath/).
JSONPath expressions always refer to a JSON structure in the same way as XPath expression are used in combination with an XML document.


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
