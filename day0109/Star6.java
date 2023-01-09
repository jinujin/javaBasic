package day0109;

import java.util.Scanner;

public class Star6 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();
//        for(int i=1;i<=2*input-1;i++) System.out.print("*");
        for (int i=1;i<=input;i++){
            if(i==1) for(int n=1;n<=2*input-1;n++) System.out.print("*");
            else System.out.println();
            for (int j=1;j<i;j++){
                System.out.print("a");
            }
//            for(int k=2*i-1;k>i;k--) System.out.print("*");

        }
        System.out.println();
        System.out.println("sol 2");
        for(int i=1;i<=input;i++){
            String stars ="";
            for(int j=1;j<=i-1;j++){
                stars += " ";
            }
            // -2 * i + (2 * input + 1) = 2 * (input - i) + 1
            for(int j = 1; j<=2*(input-i)+1;j++){
                stars += "*";
            }

            System.out.println(stars);

        }
        System.out.println();
        System.out.println("sol 3");
        for(int i=input;i>=1;i--){
            String stars ="";
            for(int j=1;j<=input-i;j++){
                stars += " ";
            }
            for(int j = 1; j<=2*i-1;j++){
                stars += "*";
            }

            System.out.println(stars);

        }
    }
}
