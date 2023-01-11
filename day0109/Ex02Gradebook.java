package day0109;
// 사용자로부터 번호, 이름, 국어, 영어, 수학 점수를 입력 받아서
// 각각의 정보를 다음과 같이 출력되는 프로그램을 작성하시오.
// 단, 입력에 관한 메소드, 출력에 관한 메소드, 총점 및 평균을 계산 하는 메소드를 따로 분리하시오.

// 출력 방법:
// 번호: ###번 이름: ###
// 국어: ##점 영어: ##점 수학: ##점
// 총점: ##점 평균: ##.#####점


import util.ScannerUtil;

import java.util.Scanner;

public class Ex02Gradebook {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        // 입력

        int id = getId(scan);

        String name = getName(scan);

        int korean = getKorean(scan);

        int english = getEnglish(scan);

        int math = getMath(scan);


        // 출력
        printInfo(id, name, korean, english, math);

        scan.close();
    }


    public static int getId(Scanner scan){
//        int temp;
//        String message;
        String message ="학생의 번호를 입력해주세요.";
//        System.out.println(message);
//        System.out.print("> ");
//        temp = scan.nextInt();

//        return temp;
        return ScannerUtil.nextInt(scan, message);
    }

    public static String getName(Scanner scan){
        String temp;
//        String message;
        String message ="학생의 이름을 입력해주세요.";

        temp = ScannerUtil.nextLine(scan,message);
//        System.out.println(message);
//        System.out.print("> ");
//        scan.nextLine();
//        temp = scan.nextLine();
        // 정수 나 실수 입력 후에 남은 버퍼 메모리에 남은 엔터(\n)를 지우기 위해 nextLine()
        // 두번 사용

        return temp;
    }

    public static int getKorean(Scanner scan){
        int temp;
        String message;
        message ="학생의 국어 점수를 입력해주세요.";
        System.out.println(message);
        System.out.print("> ");
        temp = scan.nextInt();

        int min;
        int max;
        min = 0;
        max = 100;
        while(temp < min || temp > max){
            System.out.println("잘못 입력하셨습니다.(0~100)");
            System.out.println(message);
            System.out.print("> ");
            temp = scan.nextInt();
        }

        return temp;
    }

    public static int getEnglish(Scanner scan){
//        int temp;
//        String message;
        String message ="학생의 영어 점수를 입력해주세요.";
//        System.out.println(message);
//        System.out.print("> ");
//        temp = scan.nextInt();

//        int min;
//        int max;
//        min = 0;
//        max = 100;
//        while(temp < min || temp > max){
//            System.out.println("잘못 입력하셨습니다.(0~100)");
//            System.out.println(message);
//            System.out.print("> ");
//            temp = scan.nextInt();
//        }

        return ScannerUtil.nextInt(scan,message,0,100);
    }

    public static int getMath(Scanner scan){
        int temp;
        String message;
        message ="학생의 수학 점수를 입력해주세요.";
        System.out.println(message);
        System.out.print("> ");
        temp = scan.nextInt();

        int min;
        int max;
        min = 0;
        max = 100;
        while(temp < min || temp > max){
            System.out.println("잘못 입력하셨습니다.(0~100)");
            System.out.println(message);
            System.out.print("> ");
            temp = scan.nextInt();
        }

        return temp;
    }


    public static void printInfo(int id, String name, int k, int m, int e){


        System.out.println("번호: "+id+"번"+"  이름: "+name);
//        System.out.println("국어: "+k+"점"+" 영어: "+e+"점"+" 수학: "+m+"점");
        System.out.printf("국어: %d점 영어: %d점 수학: %d점\n", k,e,m);
        System.out.printf("총점: %d점 평균: %.2f점\n",calculateSum(k,e,m),calculateMean(k,e,m));

    }

    public static int calculateSum(int k, int e, int m){

        return k+e+m;
    }
    public static double calculateMean(int k, int e, int m){
        final int SUBJECT_SIZE = 3;
        return calculateSum(k,e,m)/(double)SUBJECT_SIZE;
    }
}
