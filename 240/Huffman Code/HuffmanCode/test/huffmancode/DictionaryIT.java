/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huffmancode;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sean Batzel
 */
public class DictionaryIT {
    
    public DictionaryIT() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of add method, of class Dictionary.
     */
    @Test
    public void testAdd() {
        System.out.println("add");
        Dictionary instance = new Dictionary();
        instance.add('A',new StringBuffer("W"));
        instance.add('B',new StringBuffer("X"));
        instance.add('C',new StringBuffer("Y"));
        instance.add('D',new StringBuffer("Z"));
    }

    /**
     * Test of get method, of class Dictionary.
     */
    @Test
    public void testGet() {
        System.out.println("get");
        char key = ' ';
        Dictionary instance = new Dictionary();
        StringBuffer expResult = null;
        StringBuffer result = instance.get(key);
        assertEquals(expResult, result);
    }

    /**
     * Test of printMap method, of class Dictionary.
     */
    @Test
    public void testPrintMap() {
        System.out.println("printMap");
        Dictionary instance = new Dictionary();
        instance.add('A',new StringBuffer("W"));
        instance.add('B',new StringBuffer("X"));
        instance.add('C',new StringBuffer("Y"));
        instance.add('D',new StringBuffer("Z"));
        instance.printMap();
    }
}
