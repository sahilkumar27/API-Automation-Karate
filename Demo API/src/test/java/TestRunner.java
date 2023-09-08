import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate GetAPITest(){
        return Karate.run("Get").relativeTo(getClass());
    }

    @Karate.Test
    Karate PostAPITest(){
        return Karate.run("Post").relativeTo(getClass());
    }

    @Karate.Test
    Karate PutAPITest(){
        return Karate.run("Put").relativeTo(getClass());
    }


    @Karate.Test
    Karate DeleteAPITest(){
        return Karate.run("Delete").relativeTo(getClass());

    }
}

/* For accessing all the features file in One report with Command Prompt commands
    ->   cd C:\Users\Sahil kumar\Desktop\karate Api automation\Demo API
      * After Running this (cd)
    ->  mvn test
 */
