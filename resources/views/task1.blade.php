<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>List of Posting</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">

            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth


                                <a class="nav-link" href="{{ route('task1') }}">Task1</a>
                          
                           
                                <a class="nav-link" href="{{ route('task2') }}">Task2</a>
                           
                           
                                <a class="nav-link" href="{{ route('task3') }}">Task3</a>
                          
                           
                                
                           
                </div>
                        @endif

              <div class="content">
                <div class="title m-b-md">
                    List of Posting 
                </div>
                   <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Status</th>
                                         <th>Create At</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $count= 1;
                                    ?>
                                    @foreach($ListofPosting as $rows)
                                    <tr class="gradeU">
                                       
                                        <td>{!!$count!!}</td>
                                        <td>{!!$rows->getPostingDone->name!!}</td>
                                        <td>{!!$rows->status!!}</td>
                                        <td>{!! date('d M Y', strtotime($rows->created_at))!!}</td>
                                        
                                    </tr>
                                    <?php $count++; ?>
                                    @endforeach
                                </tbody>
                            </table>
              
            </div>
        </div>
    </body>
</html>
