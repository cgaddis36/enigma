require 'faraday'

response = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json'
