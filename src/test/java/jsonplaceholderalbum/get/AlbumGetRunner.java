package jsonplaceholderalbum.get;

import com.intuit.karate.junit5.Karate;

public class AlbumGetRunner {

    @Karate.Test
    Karate albumGet(){
        return Karate.run("album-get").relativeTo(getClass());
    }
}
