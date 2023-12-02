package jsonplaceholderalbum.put;

import com.intuit.karate.junit5.Karate;

public class AlbumPutRunner {

    @Karate.Test
    Karate albumPut(){
        return Karate.run("album-put").relativeTo(getClass());
    }
}
