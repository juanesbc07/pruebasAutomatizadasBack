Feature: Automatización Integral de JSONPlaceholder

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Obtener todos los posts
    Given path '/posts'
    When method get
    Then status 200
    And match each response[*].id == '#? _ > 0'
    And match each response[*].title != null
    And match response[0].userId == 1

  Scenario: Crear un nuevo post
    Given path '/posts'
    And request { userId: 202, title: 'Nuevo Post', body: 'Contenido del nuevo post' }
    When method post
    Then status 201
    And match response.id != null
    And match response.title == 'Nuevo Post'

  Scenario: Actualizar un post existente
    Given path '/posts/2'
    And request { title: 'Post Actualizado' }
    When method put
    Then status 200
    And match response.title == 'Post Actualizado'

  Scenario: Eliminar un post
    Given path '/posts/3'
    When method delete
    Then status 200