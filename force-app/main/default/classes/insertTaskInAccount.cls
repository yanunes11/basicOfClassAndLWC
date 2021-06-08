/**
 * @name: insertTaskInAccount
 * @author: Yan Nascimento
 * @date: 06/08/2021
 * @purpose: insert a new task in a account when Rating fiel of this account is updated
 * lOGS:
 * 06/08/2021 - Yan Nascimento
 */

public with sharing class insertTaskInAccount {
    public static void insertTaskInAccount(List<Account> Accountlist) {
        List<Task> tk = new List<Task>(); //1. List_1 that will be insert at the end
        
        //2. For Loop that runs the Trigger.New
        for (Account acct : Accountlist) {
            if (acct.Rating == 'Hot') {
                //3. List_2 that receive that receives the variables insede for loop
                Task taskList = new Task();
                taskList.WhatId = acct.Id;
                taskList.Subject = 'By trigger' + acct.Name;
                taskList.Status = 'In Progress';
                taskList.Priority = 'High';
                tk.add(taskList);
            }
        }
        //4. Insert List_1
        if (tk.size() > 0) {
            INSERT tk;
        }
    }
}
