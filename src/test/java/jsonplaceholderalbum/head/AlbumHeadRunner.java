package jsonplaceholderalbum.head;

import com.intuit.karate.junit5.Karate;

public class AlbumHeadRunner {

    @Karate.Test
    Karate albumHead(){
        return Karate.run("album-head").relativeTo(getClass());
    }
}
