package com.arjjs.ccm.test;

public class Test {

	public static void main(String[] args) {
		Test.writeThread thread = new Test.writeThread();
		thread.start();
		System.out.println("1");
		System.out.println("2");
		System.out.println("3");
		System.out.println("4");
	}

	public static class writeThread extends Thread{
		public void run(){
			for (int i=0;i<1000;i++){
				System.out.println("无返回值"+i);
			}
		}
	}
}
