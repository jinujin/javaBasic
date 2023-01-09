package day0109;

import java.util.Scanner;

public class Star9 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();
        int totalHeight = 2*input -1;
        for (int i=1;i<=input;i++){
            System.out.println();
            for (int j=input;j>i;j--){
                System.out.print(" ");
            }
            for(int j = 1; j<=2*i-1;j++){
                System.out.print("*");
            }
        }
        for(int k=input;k>1;k--){
            System.out.println();
            for(int j=0;j<=input-k;j++){
                System.out.print(" ");
            }
            for(int j = 1; j<=2*k-3;j++){
                System.out.print("*");
            }

        }
        System.out.println();
        System.out.println("sol 2");
        for(int i=1;i<=totalHeight;i++) {
            String stars = "";
            int spaceWidth=0;
            int starWidth=0;
            if(i<input){
                // 윗부분
                for (int j = 1; j <= input - i; j++) {
                    stars += " ";
                }
                for (int j = 1; j <= 2 * i - 1; j++) {
                    stars += "*";
                }
            }
            else{
                // 아랫부분
                int lowerI = i-input+1;
                for(int j =1;j<=lowerI-1;j++){
                    stars += " ";
                }
                for (int j=1;j<=2*(input-lowerI)+1;j++){
                    stars += "*";
                }
            }



            System.out.println(stars);
        }

//        for(int i=1;i<=totalHeight;i++) {
//            String stars2 = "";
//            int spaceWidth=0;
//            int starWidth=0;
//
//            if(i<input){
//                // 윗부분
//                spaceWidth = input -1;
//                starWidth = 2*i-1;
//                for (int j = 1; j <= input - i; j++) {
//                    stars += " ";
//                }
//                for (int j = 1; j <= 2 * i - 1; j++) {
//                    stars += "*";
//                }
//            }
//            else{
//                // 아랫부분
//                int lowerI = i-input+1;
//                for(int j =1;j<=lowerI-1;j++){
//                    stars += " ";
//                }
//                for (int j=1;j<=2*(input-lowerI)+1;j++){
//                    stars += "*";
//                }
//            }
//
//
//
//            System.out.println(stars);
//        }
    }
}
