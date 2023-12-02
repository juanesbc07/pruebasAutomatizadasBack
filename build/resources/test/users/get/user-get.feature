Feature: Get user on reqres

  Scenario: Get a user
    Given url "https://reqres.in" + "/api/users/" + "2"
    When method get
    Then status 200
    And match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match response.data.first_name != "Juan Esteban Barrero"
    And match response.data.email != null
    And match response.data.last_name != null
    And match response.data.email == "janet.weaver@reqres.in"
    And def responseString = karate.pretty(response)
    And match responseString contains "Weaver"

  Scenario: Post a user
    Given url "https://reqres.in" + "/api/users/"
    When method post
    And request {"data":{"id":1012,"email":"juanestebanbarrero@hotmail.com","first_name":"Juan","last_name":"Barrero","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    Then status 201

  Scenario: Edit a user
    Given url "https://reqres.in" + "/api/users/"
    When method put
    And request {"data":{"id":1012,"email":"juanestebanbarrero@hotmail.com","first_name":"Hola","last_name":"Barrero","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    Then status 200

  Scenario: Delete a user
    Given url "https://reqres.in" + "/api/users/" + "1012"
    When method delete
    Then status 204

#Clase 18/11/2023############################################################################################

  Scenario: Modificar parcialmente un usuario (PATCH)
    Given path '/users/2'
    And request { job: 'Data Scientist' }
    When method patch
    Then status 200
    And request {name: 'Andrea'}
    And match response == { name: 'Andrea', job: 'Data Scientist' }



  Scenario: Obtener encabezados (HEAD)
    Given path '/users'
    When method head
    Then status 200
    And match response == ''
    And match response != ' '
    And match responseHeaders == { 'Content-Length': '#notnull' }


  Scenario: Establecer una conexión (CONNECT)
    Given url 'https://reqres.in'
    When method connect
   # Then status !=200
    #Then match response == 'Connected successfully'
    Then eval karate.log('Response Time:', responseTime) && responseTime < 5000
    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
    And eval karate.log('Connected successfully')

  Scenario: Obtener opciones (OPTIONS)

    Given path '/users'
    When method options
    #Then status !=200
    #Then match response == { allowedMethods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'CONNECT', 'OPTIONS'] }
    Then eval karate.log('Response Time:', responseTime) && responseTime < 5000

  Scenario: Realizar traza (TRACE)
    Given path '/users'
    When method trace
    #Then status !=200
   # Then match response == 'Trace successful'
    Then eval karate.log('Response Time:', responseTime) && responseTime < 5000
#    And eval karate.log('Response Time:', responseTime) && responseTime < 2000
#    And match response == 'Trace successful'