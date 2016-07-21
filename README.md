# Unofficial New Scientist JSON API

Simple JSON API wrapper for New Scientist's XML feeds. _All content sourced directly from publically available news feeds; this data has not been changed or modified from the original content creator_. This API is for education purposes only.

## Requesting an API key

* Send a GET request to: https://new-scientist-api.herokuapp.com/register/your_requested_username
* A response will be provided to valid usernames with a response JSON of:

```json
{
  "username":"who_you_are",
  "api_key":"some_guid",
  "created_on":"UTC timestamp",
  "ip":"::1","host":"localhost"
}
```

## Authentication

All requested must contain the query string parameter of `?api_key=your_guid`.

## Endpoints 

The current version of this api is v1. All resources may be requested at the root of https://new-scientist-api.herokuapp.com/api/v1

* `/` - All articles.
* `/news` - News articles.
* `/features` - New Scientist features.
* `/math-pyshics` - Math & Physics.
* `/tech` - Technology.
* `/space` - Space exploration.
* `/life` - Life sciences.
* `/environment` - Environmental Sciences
* `/health` - Health Sciences
* `/humans` - Anthro-related topics

#### Example Usage

* https://new-scientist-api.herokuapp.com/api/v1?api_key=your_key
* https://new-scientist-api.herokuapp.com/api/v1/tech?api_key=your_key

## Technologies Used

- Ruby
- Sinatra
- Firebase


## Logging Enabled

Please note that all requests will have their IP and hostname logged.
