Feature: json feature testing

  Scenario: json reader parser

    * def jsonObject =
    """
    [

    {
      "name" : "Sahil",
      "age" : "19",
      "city" : "Jharkhand"

    },
    {
      "name" : "Devender",
      "age" : "24",
      "city" : "Rajasthan"
    }

    ]
    """

    * print jsonObject

  # Calling Json array inside an object of each index.
  # If the file not running then go Run -> Edit configurations -> select the failed running config -> Shorten command line: @argfile (Java 9+) -> OK

    * print jsonObject[0]
#    * print jsonObject[1].name + " " + jsonObject[1].city + " " + jsonObject[1].age

  Scenario: Complex json reader
    * def jsonObject =
    """
{"widget": {
    "debug": "on",
    "window": {
        "title": "Sample Json Examples",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": {
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
}}
    """

    * print jsonObject
    * print jsonObject.widget.debug
    * print jsonObject.widget.window
    * print jsonObject.widget.image
