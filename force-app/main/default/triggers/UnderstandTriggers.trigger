trigger UnderstandTriggers on Account (before delete, before update) {

    // switch on Trigger.operationType{

    //     when BEFORE_DELETE{



    //     }
    //     when BEFORE_UPDATE{

    //     }
    // }


    for(Account everyaccount : Trigger.old)
    System.debug(everyaccount.Id);

}