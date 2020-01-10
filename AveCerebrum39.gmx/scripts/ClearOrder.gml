///ClearOrder(Actor);

actor = argument0;

ds_queue_clear(actor.actionQueue);
actor.currentAction = noone;
actor.queueX = actor.gridX;
actor.queueY = actor.gridY;

ds_list_clear(actor.queuePainter.drawTable);
