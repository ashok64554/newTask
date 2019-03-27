<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\User;
use App\Posting;
use App\Expertise;
use App\PostingExpertise;
use App\PostingWorker;

class TaskController extends Controller
{
	//Posting List where Posting  status done and user Matched
	public function task1()
	{
		$uuid='f43fdk-34390fg-4545kf-5545'; // John Due uuid Given
		$worker_id=User::select('id')->where('uuid',$uuid)->first();
		$ListofPosting=PostingWorker::join('postings', function ($join) {
	        $join->on('posting_workers.posting_id', '=', 'postings.id');
	    })
	    ->where('posting_workers.worker_id',$worker_id->id)
		->where('posting_workers.status','matched') // john Due Matched
		->where('postings.status','done') //  Posting Status Done
		->get();
		return view('task1',compact('ListofPosting'));

	}
	//List of Posting Where User are  availble 
	public function task2()
	{
		$uuid='f43fdk-34390fg-4545kf-5545'; // John Due uuid Given
		$worker_id=User::select('id')->where('uuid',$uuid)->first();
		$ListofPosting=PostingWorker::join('postings','posting_workers.posting_id','=','postings.id')
		->where('posting_workers.worker_id',$worker_id->id)
		->where('postings.status','available')// Posting Staus Availble
		->get();
		return view('task2',compact('ListofPosting'));

	}
	// List of all Expertises
	public function task3()
	{

		$ListofExpertise=PostingExpertise::join('expertises','posting_expertises.expertise_id','=','expertises.id')
		->groupBy('expertise_id','expertises.name')
		->selectRaw('count(posting_id) as count, expertises.name as name,expertise_id as id')
		->get();
		return view('task3',compact('ListofExpertise'));

	}
}
