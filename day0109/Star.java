package day0109;
import java.util.*;
public class Star {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();
        System.out.println("별 1");

        int i,j;
        for(i=1;i<=input;i++) {
            System.out.println();
            for (j = 1; j <= i; j++) {
                System.out.print("*");
            }

        }
    }
}
