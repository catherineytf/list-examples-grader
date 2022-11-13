import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.*;

public class TestListExamples {
  // Write your grading tests here!
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
  @Test
  public void testFilter(){
    StringChecker ls = new LongString();
    ArrayList<String> input = new ArrayList<>();
    input.add("apple");
    input.add("banana");
    input.add("pear");
    input.add("strawberry");
    input.add("blackberry");
    ArrayList<String> expected = new ArrayList<>();
    expected.add("banana");
    expected.add("strawberry");
    expected.add("blackberry");
    assertEquals(expected,ListExamples.filter(input, ls));
 }

}
