package multiqueue;

import java.io.*;
import scranton.queue.Queue;
import scranton.queue.QueueViaStandard;
import java.util.*;

class MQDriver {
    public static void main(String args[]) throws IOException {
        final int n = 5;
        Queue<String>[] q = new QueueViaStandard[n];
        for (int i = 0; i < n; i++) {
            q[i] = new QueueViaStandard<String>();
        }
        BufferedReader inBuf = new BufferedReader(new FileReader("MultiQ.txt"));
        while (inBuf.ready()) {
            try {
                StringTokenizer Token = new StringTokenizer(inBuf.readLine(), "\t");
                String sym = Token.nextToken();
                int num = Integer.parseInt(Token.nextToken());
                if (sym.equals("#")) {
                    // System.out.print the contents of the "num" queue
                    while (!q[num].isEmpty()) {
                        if (q[num].isEmpty()) {
                            break;
                        }
                        System.out.print(q[num].remove());
                    }
                } else {
                    // Place the "sym" into "num" queue
                    q[num].insert(sym);
                }
            } catch (NoSuchElementException e) {
                break;
            }
        }
    }
}
