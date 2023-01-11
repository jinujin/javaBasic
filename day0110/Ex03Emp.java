package day0110;

/*
 사원 관리 프로그램을 작성하시오.
 단, 사원 정보(사원 번호, 이름, 직급, 소속 부서, 연봉)은 하나의 구조체로 통제하고,
 사원 정보 입력, 출력은 별개의 메소드를 통하여 관리합니다.
 */

import util.ScannerUtil;

import java.util.Scanner;

public class Ex03Emp {
    public static void main(String[] args) {
        EInfo e = new EInfo();
        Scanner sc = new Scanner(System.in);
        // sol 1
//        inputInfo(sc,e);
//        printInfo(e);

        // sol 2
        insertInfo(sc, e);
        printInfo2(e);

        sc.close();
    }

    public static EInfo inputInfo(Scanner sc, EInfo e){

        System.out.print("사원 번호: ");
        e.id = sc.nextInt();
        System.out.print("이름: ");
        sc.nextLine();
        e.name = sc.nextLine();
        System.out.print("직급: ");
        e.posi = sc.nextLine();
        System.out.print("소속 부서: ");
        e.instru = sc.nextLine();
        System.out.print("연봉: ");
        e.salary = sc.nextInt();
        return e;
    }

    public static void printInfo(EInfo e){
//        EInfo e = new EInfo();
        System.out.print("사원 번호: "+e.id);
        System.out.print(" 이름: "+e.name);
        System.out.print(" 직급: "+e.posi);
        System.out.print(" 소속 부서: "+e.instru);
        System.out.print(" 연봉: "+e.salary);

    }
    //sol 2
    public static void insertInfo(Scanner scanner, EInfo e){
        //각종 출력에서 사용할 메시지를 작성할 String 변수 message
        String message;

        // 사원 번호 입력
        message = "사원의 번호를 입력해주세요.";
        e.id = ScannerUtil.nextInt(scanner, message);

        // 사원 이름 입력
        message = "사원의 이름을 입력해주세요.";
        e.name = ScannerUtil.nextLine(scanner,message);

        // 사원 직급 입력
        message = "사원의 직급을 입력해주세요.";
        e.posi = ScannerUtil.nextLine(scanner,message);

        // 사원 부서 입력
        message = "사원의 부서를 입력해주세요.";
        e.instru = ScannerUtil.nextLine(scanner,message);

        // 사원 연봉 입력
        message = "사원의 연봉을 입력해주세요.";
        e.salary = ScannerUtil.nextInt(scanner,message);
    }

    public static void printInfo2(EInfo e){
        System.out.println("--------------------------------------");
        System.out.println("사원 번호: "+ e.id);
        System.out.println("사원 이름: "+ e.name);
        System.out.println("사원 직급: "+ e.posi);
        System.out.println("사원 부서: "+ e.instru);
        System.out.println("사원 연봉: "+ e.salary);
        System.out.println("--------------------------------------");
    }
}
