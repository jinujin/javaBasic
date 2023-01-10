package day0109;

import java.util.Scanner;

public class Star7 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("별 갯수 : ");
        int input = scanner.nextInt();
        int height = 2 * input -1;
//        String stars = "";

        for (int i=1;i<=input;i++){
            System.out.println();
            for (int j = 1;j<=i;j++) {
                System.out.print("*");
            }
        }
        for (int i=1;i<=input;i++){
            System.out.println();
            for (int j = input;j>i;j--){
                System.out.print("*");
            }
        }


    }
}
