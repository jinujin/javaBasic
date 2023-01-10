package day0110;

/*
 로또 시뮬레이터
 ver4.0
 사용자로부터 총 몇 게임할지 입력 받은 후에
 해당 게임마다 각각 자동/수동 입력을 받아서
 알맞게 처리하는 프로그램
 */

import util.Scannerutil;

import java.util.Random;
import java.util.Scanner;
public class Ex11Lotto04 {
    public static final Scanner SCANNER = new Scanner(System.in);
    public static final Random RANDOM = new Random();
    public static final int ARRAY_LENGTH = 6;


    public static void main(String[] args) {
        String message = "총 몇게임을 하시겠습니까?";
        int gamesize = Scannerutil.nextInt(SCANNER,message);

        int[][] userNumbers = new int[gamesize][ARRAY_LENGTH];

        setNumbers(userNumbers);
        int[] computerNumbers = new int[ARRAY_LENGTH];
        Ex10Lotto03.setAutoNumbers(computerNumbers);
        Ex10Lotto03.sort(computerNumbers);

        printResult(userNumbers, computerNumbers);
    }

    public static void setNumbers(int[][] arrays){
        for(int i =0;i< arrays.length;i++){
            System.out.println((i+1)+"번째 게임");
            String message = " 1. 자동 2. 수동 ";
            int userChoice = Scannerutil.nextInt(SCANNER,message,1,2);

            if(userChoice==1){
                Ex10Lotto03.setAutoNumbers(arrays[i]);
            }else{
                Ex10Lotto03.setManualNumbers(arrays[i]);
            }

            Ex10Lotto03.sort(arrays[i]);

        }

    }
    public static void printResult(int[][] userNumbers, int[] computerNumbers){
        System.out.print("컴퓨터 숫자: ");
        printArray(computerNumbers);
        System.out.println();
        System.out.println("사용자 숫자");
        for(int i =0;i< userNumbers.length;i++){
            System.out.printf("%d번 게임",i+1);
            printArray(userNumbers[i]);
            System.out.printf(" - %d개\n",countSame(computerNumbers,userNumbers[i]));
        }
    }

    public static void printArray(int[] array){
        System.out.print("[");
        for(int i=0;i< array.length;i++){
            System.out.printf("%2d", array[i]);
            if(i< array.length-1){
                System.out.print(", ");
            }
        }
        System.out.print("]");
    }
    public static int countSame(int[] computerNumbers, int[] userNumbers){
        int count = 0;
        for(int i=0; i< computerNumbers.length;i++){
            if(Ex10Lotto03.contains(userNumbers,computerNumbers[i])){
                count++;
            }
        }
        return count;
    }

}







/*
public class Ex11Lotto04 {
    public static final Scanner SCANNER = new Scanner(System.in);
    public static final Random RANDOM = new Random();
    public static final int NUMBER_LENGTH = 6;
    public static int[] userNumbers = new int[NUMBER_LENGTH];
    public static int[] computerNumbers = new int[NUMBER_LENGTH];
    public static int GAMES = Scannerutil.nextInt(SCANNER,"게임 수");
    public static int[][] check = new int[GAMES][];
    public static void main(String[] args) {

//        int []count = new int[GAMES];
        for(int i=0;i<GAMES;i++){
            String message = "1. 자동 2. 수동";
            int userChoice = Scannerutil.nextInt(SCANNER,message);
            if(userChoice == 1){
                setAutoNumbers(userNumbers);
            } else {
                setManualNumbers(userNumbers);
            }
            sort(userNumbers);

            setAutoNumbers(computerNumbers);
            sort(computerNumbers);
            for (int j =0;j<GAMES;j++){
                check[i][0]=i+1;
                check[i][j]=countSame();
            }

            printResult();

        }
        for(int i =0;i<check[0].length;i++){
            for(int j=0;j<check[1].length;j++){
                System.out.println(check[i][j]);
            }
        }

    }
    public static void setAutoNumbers(int[] array){
        Random random = new Random();
        for(int i=0;i< array.length;){
            int temp = random.nextInt(45)+1;
            if(!contains(array, temp)){
                array[i] = temp;
                i++;
            }
        }
    }

    public static boolean contains(int[] array, int element){
        for(int i =0 ; i< array.length;i++){
            if(element == array[i]){
                return  true;
            }
        }

        return false;
    }

    public static void setManualNumbers(int[] array){
        for(int i =0; i< array.length;){
            int temp = Scannerutil.nextInt(SCANNER,"1-45 사이의 숫자를 입력해주세요.",1,45);
            if(!contains(array,temp)){
                array[i] = temp;
                i++;
            }else{
                System.out.println("중복된 숫자는 입력하실 수 없습니다.");
            }
        }
    }
    public static void sort(int[] array){
        for(int i=0;i<array.length-1;i++){
            if(array[i]>array[i+1]){
                int temp = array[i];
                array[i] = array[i+1];
                array[i+1] = temp;
                i = -1;
            }
        }
    }

    public static void printResult(){
        System.out.println("사용자의 숫자");
        printArray(userNumbers);

        System.out.println("컴퓨터의 숫자");
        printArray(computerNumbers);

        System.out.println("총 맞은 갯수: "+countSame());
    }

    public static void printArray(int[]array){
        for(int i=0;i<array.length;i++){
            System.out.printf("%d",array[i]);
            if(i< array.length-1){
                System.out.print(", ");
            } else{
                System.out.println();
            }
        }
    }

    public static int countSame(){
        int count = 0;
        for(int i=0; i< computerNumbers.length;i++){
            if(contains(userNumbers,computerNumbers[i])){
                count++;
            }
        }

        return count;
    }
//    public static int[][] check(int [][] count){
//        int [][] array = new int[GAMES][];
//
//        for(int i=0;i<GAMES;i++){
//            for(int j=0;i<count[i].length;j++){
//                array[i][j]=count[i] ;
//            }
//
//
//        }
//        return array;
//    }
}

 */
