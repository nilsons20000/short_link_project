# short_link_project

**Project description**

Users often need to derive a short link from a long one and vice versa for various purposes. For example, to hide the long link itself at first, or to share a link with friends that does not take up more space. 
It is also useful for SMS sending, so that the link does not take up most of the text or article in social networks, so that it can fit within the specified limits / volumes in terms of text (symbols), etc. 
Therefore, an API interface was developed on a local server with Ruby on Rails, with the help of which, by providing the necessary parameters in the body (long or short link), the encoding / decoding link required by the user will be output in JSON format.
The project includes a total of three methods in the LinksController class:
1. ```def get_random_short_symbol``` – a method that generates a string of symbols consisting of up to 5 symbols, which includes letters (a-z) and numbers (0-9). 
   A check for uniqueness is performed by means of recursion, i.e. a string of symbols will be generated until there is a unique string that does not match the ones already in the links_hash array.
2. ```def encode``` – the method processes the parameter entered in the API body field, calls the get_random_short_symbol described above, generates the short link, saved the generated symbol string as a key in the array in order to speed up the search, and stores the rest of the information in the index array and records the processed information in JSON format.
3. ```def decode``` – the method processes the parameter entered in the API body field,
initialized the original existing host and reads the symbol string after the “/” symbol that was generated by the get_random_short_symbol method, passes the symbol string into an array as a key, if a match is found, then the string is decoded.

**Project install**

1. Install the _Ruby_ package on your computer from https://rubyinstaller.org/,
2. Install _Rails_ with the ```gem install rails``` command in the command line,
3. Clone the repository with the project in the _root_ project folder from the git repository with the command ```git clone https://github.com/nilsons20000/short_link_project.git``` ,
4. Go to the _root_ folder of the project using the _cmd_ command line,
5. When going to the root folder, start the rails server with the rails server command,
6. Open _PowerShell_ and enter an _API_ request for link decoding and decoding, respectively, where the long_link parameter will be a long link and the short_link parameter will be a short link:

**Encode**

```
Invoke-RestMethod -Uri "http://127.0.0.1:3000/encode" -Method POST -Body 'long_link=https://example.com' -ContentType "application/x-www-form-urlencoded" -Headers @{ "Accept" = "application/json" } | ConvertTo-Json
```

Display result in JSON format:


```
{
    "encoded_long_link_to_short":  "http://127.0.0.1:3000/22e4v"
}
```

**Decode**

```
Invoke-RestMethod -Uri "http://127.0.0.1:3000/decode" -Method POST -Body 'short_link=http://127.0.0.1:3000/22e4v' -ContentType "application/x-www-form-urlencoded" -Headers @{ "Accept" = "application/json" } | ConvertTo-Json```
```
Display result in JSON format:

```
{
    "decode_short_link_to_long":  "https://example.com"
}
```




