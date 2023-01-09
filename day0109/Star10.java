package day0109;

import java.util.Scanner;

public class Star10 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("별 숫자 : ");
        int input = scan.nextInt();

        int totalHeight = 2*input-1;
        for(int i =1;i<=totalHeight;i++){
            String stars ="";
            if(i==1 || i==totalHeight){
                for(int j=1;j<=totalHeight;j++) stars += "*";
            } else{
                int starWidth = 0;

                if(i<input){
                    starWidth = input - i+1;
                }else{
                    int lowerI = i - input +1;
                    starWidth = lowerI;
                }

                int spaceWidth = totalHeight - 2 * starWidth;

                for(int j=1;j<=starWidth;j++){
                    stars += "*";
                }

                for (int j=1;j<=spaceWidth;j++){
                    stars += " ";
                }

                for(int j =1; j<=starWidth;j++){
                    stars += "*";
                }
            }

            System.out.println(stars);
        }


    }
}
