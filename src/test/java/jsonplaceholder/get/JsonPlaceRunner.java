package jsonplaceholder.get;

import com.intuit.karate.junit5.Karate;

public class JsonPlaceRunner {

    @Karate.Test
    Karate JsonPlace(){
        return Karate.run("json-place").relativeTo(getClass());
    }

}
