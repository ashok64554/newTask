<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PostingWorker extends Model
{
      protected $fillable = [
        'uuid', 'worker_id','posting_id','status'
    ];
}
