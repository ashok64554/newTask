<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Posting;
use App\User;

class PostingWorker extends Model
{
      protected $fillable = [
        'uuid', 'worker_id','posting_id','status'
    ];

     public function getPostingDone()
	{
	    return $this->belongsTo(Posting::class, 'posting_id', 'id')->where('status','done');
	}
	
	 public function getPostingAvail()
	{
	    return $this->belongsTo(Posting::class, 'posting_id', 'id')->where('status','available');
	}

}
