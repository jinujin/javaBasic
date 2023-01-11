package day0110;

/*
 로또번호 추첨기
 ver 3.0
 사용자 숫자 추가

 사용자로부터 1. 자동 2. 수동 입력받아서
 각각에 맞게 메소드를 실행시킨 후
 컴퓨터의 숫자와 비교해서
 사용자 숫자, 컴퓨터 숫자, 총 맞은 갯수를 출력하는 프로그램을 작성하시오.
 */

import util.ScannerUtil;

import java.util.Random;
import java.util.Scanner;

public class Ex10Lotto03 {
    public static final Random RANDOM = new Random();
    public static final Scanner SCANNER = new Scanner(System.in);
    public static final int NUMBER_LENGTH = 6;
    public static int[] userNumbers = new int[NUMBER_LENGTH];
    public static int[] computerNumbers = new int[NUMBER_LENGTH];
    public static void main(String[] args) {
/* sol 1
        System.out.println("1. 자동 2. 수동");
        System.out.print("> ");
        int n = SCANNER.nextInt();
        if(n==1){
            autoNumber();
        } else if(n==2){
            insertNumber(SCANNER);
        }
*/
        String message = "1. 자동 2. 수동";
        int userChoice = ScannerUtil.nextInt(SCANNER,message);

        if(userChoice == 1){
            setAutoNumbers(userNumbers); // 자동
        } else {
            setManualNumbers(userNumbers); // 수동
        }

        sort(userNumbers);

        setAutoNumbers(computerNumbers);
        sort(computerNumbers);

        printResult();
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
            int temp = ScannerUtil.nextInt(SCANNER,"1-45 사이의 숫자를 입력해주세요.",1,45);
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


    /*
    public static int[] autoNumber(){
        int []lottoNumbers = new int[NUMBER_LENGTH];

        for(int i = 0; i < NUMBER_LENGTH;){
            int temp = RANDOM.nextInt(45)+1;
            boolean numberSwitch = true;
            for(int j=0; j<i;j++){
                if(temp==lottoNumbers[j]){
                    numberSwitch = false;
                }
            }
            if(numberSwitch==true){
                lottoNumbers[i]= temp;
                i++;
            }
        }


        return lottoNumbers;
    }

    public static int[] insertNumber(Scanner scanner){
        int []lottoNumbers = new int[6];
        String message = "숫자를 입력해주세요.";
        for(int i=0;i<NUMBER_LENGTH;){
            lottoNumbers[i]= Scannerutil.nextInt(scanner,message);
            int temp = lottoNumbers[i];
            boolean numberSwitch = true;
            for(int j=0;j<i;j++){
                if(temp==lottoNumbers[j]){
                    numberSwitch = false;
                }
            }
            if(numberSwitch==true){
                lottoNumbers[i]=temp;
                i++;
            }
        }

        return lottoNumbers;
    }*/
}
