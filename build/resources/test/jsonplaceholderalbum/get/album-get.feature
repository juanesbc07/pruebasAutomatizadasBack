Feature: Get album on jsonplaceholder

  Scenario: Get an album
    Given url "https://jsonplaceholder.typicode.com" + "/albums/1/" + "photos"
    When method get
    Then status 200
    And def responseString = karate.pretty(response)
    And match responseString contains "accusamus beatae ad facilis cum similique qui sunt"
    And match response.[1].title == "reprehenderit est deserunt velit ipsam"
    And match response.[0].thumbnailUrl == "https://via.placeholder.com/150/92c952"
    And match response.[0].albumId != "2"