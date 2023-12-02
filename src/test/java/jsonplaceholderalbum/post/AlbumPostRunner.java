package jsonplaceholderalbum.post;

import com.intuit.karate.junit5.Karate;

public class AlbumPostRunner {

    @Karate.Test
    Karate albumPost(){
        return Karate.run("album-post").relativeTo(getClass());
    }
}
