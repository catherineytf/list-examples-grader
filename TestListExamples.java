
import static org.junit.Assert.*;
 
import java.util.ArrayList;
import java.util.*;

import org.junit.*;


class LongString implements StringChecker{
  public boolean checkString(String s){
    if (s.length() > 5){
      return true;
    }
    else{
      return false;
    }
  }
}


public class TestListExamples {
 // Write your grading tests here!
 
 @Test
 public void testFilter(){
  List<String> input = Arrays.asList("apple", "banana", "pear", "strawberry", "blackberry");
  StringChecker sc = new LongString();
  List<String> expected = Arrays.asList("banana", "strawberry", "blackberry");
  assertEquals(expected, ListExamples.filter(input, sc));
}

@Test
public void testMerge(){
  List<String> input1 = Arrays.asList("a","h","k");
  List<String> input2 = Arrays.asList("b", "n");
  List<String> expected = Arrays.asList("a", "b", "h", "k", "n");
  assertEquals(expected, ListExamples.merge(input1, input2));
}

}

