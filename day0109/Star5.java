package day0109;

import java.util.Scanner;

public class Star5 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();
        for (int i=1;i<=input;i++){
            System.out.println();
            for (int j=input;j>i;j--){
                System.out.print(" ");
            }
            for(int j = 1; j<=2*i-1;j++){
                System.out.print("*");
            }

        }
        System.out.println();
        System.out.println("sol 2");
        for(int i=1;i<=input;i++){
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
