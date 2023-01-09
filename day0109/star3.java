package day0109;

import java.util.Scanner;

public class star3 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int i,j;
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();
        for(i=1;i<=input;i++){
            System.out.println();
            for(j=input;j>i;j--){
                System.out.print(" ");
            }
            for(int k =1;k<=i;k++) System.out.print("*");

        }

        for(i=1;i<=input;i++){
            String stars ="";
            for(j=1;j<=input;j++){
                if(j<=input-i){
                    System.out.print(" ");
                }
                else System.out.println("*");
            }
        }
    }
}
