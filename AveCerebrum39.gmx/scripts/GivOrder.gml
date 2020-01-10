///GivOrder(Actor,Action)

actor = argument0;
action = argument1;

ds_queue_enqueue(actor.actionQueue,action);

ds_list_add(actor.queuePainter.drawTable,action);
