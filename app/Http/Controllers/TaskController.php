<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\User;
use App\Posting;
use App\Expertise;
use App\PostingExpertise;
use App\PostingWorker;
use DB;
class TaskController extends Controller
{
	//Posting List where Posting  status done and user Matched
	public function task1(Request $request)
	{
        $uuid = 'f43fdk-34390fg-4545kf-5545';
 	    $ListofPosting= Posting::selectRaw('postings.*')->leftJoin('posting_workers', 'posting_workers.posting_id', '=', 'postings.id')
       ->leftJoin('users', 'users.id', '=', 'posting_workers.worker_id')
       ->where('posting_workers.status','matched')
       ->where('users.uuid', $uuid)
       ->where('postings.status', 'done')
       ->get();

		
		return view('task1',compact('ListofPosting'));

	}
	//List of Posting Where User are  availble 
	public function task2(Request $request)
	{
		$uuid = 'f43fdk-34390fg-4545kf-5545';
	    $ListofPosting= Posting::selectRaw('postings.*')->leftJoin('posting_workers', 'posting_workers.posting_id', '=', 'postings.id')
       ->leftJoin('users', 'users.id', '=', 'posting_workers.worker_id')
       ->where('users.uuid', $uuid)
       ->where('postings.status', 'available')
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
