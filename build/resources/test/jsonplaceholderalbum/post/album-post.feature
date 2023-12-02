Feature: Post album on jsonplaceholder

  Scenario: Post an album
    Given url "https://jsonplaceholder.typicode.com" + "/albums/1/" + "photos"
    When method post
    And request {"albumId": 1,"id": 100,"title": "accusamus beatae ad facilis cum similique qui sunt","url": "https://via.placeholder.com/600/92c952","thumbnailUrl": "https://via.placeholder.com/150/92c952"},
    Then status 201
    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
    And eval karate.log('Host:', responseHeaders.Host) && responseHeaders.Host.contains('jsonplaceholder.typicode.com')
    And eval karate.log('Location:', responseHeaders.Location) && responseHeaders.Location.contains('https://jsonplaceholder.typicode.com/albums/1/photos/5001')
    And match response.id == 5001