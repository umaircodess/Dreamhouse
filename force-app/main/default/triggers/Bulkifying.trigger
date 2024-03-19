trigger Bulkifying on Account (after insert, after update) {
    // List<Account> tobeprocessed = new List<Account>(); 
    // List<Opportunity> opportunityList = new List<Opportunity>();

    // switch on Trigger.operationType{
    //     when AFTER_INSERT{
    //         tobeprocessed=Trigger.new;
    //     }
    //     when AFTER_UPDATE{
    //         tobeprocessed = [Select Id, Name from Account where Id in :Trigger.new AND Id NOT IN (Select AccountId from Opportunity where AccountId IN :Trigger.new)];
    //     }
    // }

    // if(!tobeprocessed.isEmpty()){

    //     for (Account everyaccount : tobeprocessed) {


    //         opportunityList.add(new Opportunity(Name=everyaccount.Name + ' Opportunity',
    //                                     StageName='Prospecting',
    //                                     CloseDate=System.today().addMonths(1),
    //                                     AccountId=everyaccount.Id));
    //     }
    //     if (opportunityList.size() > 0) {
    //         insert opportunityList;
    //     }
    // }
    }