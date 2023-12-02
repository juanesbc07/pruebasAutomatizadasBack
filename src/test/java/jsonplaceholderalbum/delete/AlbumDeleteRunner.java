package jsonplaceholderalbum.delete;

import com.intuit.karate.junit5.Karate;

public class AlbumDeleteRunner {

    @Karate.Test
    Karate albumDelete(){
        return Karate.run("album-delete").relativeTo(getClass());
    }
}
