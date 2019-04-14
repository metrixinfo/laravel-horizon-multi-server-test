<?php

namespace App\Jobs;

use App\QueueLog;
use App\QueueTest;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Log;

class QueueRunJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * @var int
     */
    private $queue_test_id;

    /**
     * Create a new job instance.
     *
     * @param int $queue_test_id
     */
    public function __construct($queue_test_id)
    {
        $this->queue_test_id = $queue_test_id;
    }

    /**
     * Get the tags that should be assigned to the job.
     *
     * @return array
     */
    public function tags(): array
    {
        return ['test', 'job:'.\gethostname()];
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): void
    {
        Log::info('Handling Job for QueueTest ' . $this->queue_test_id .  ' on ' . \gethostname());

        $queue_test = QueueTest::find($this->queue_test_id);
        if(!$queue_test){
            Log::error('Unable to find QueueTest ' . $this->queue_test_id);
        }

        $queue_test->increment('run_counter');

        \sleep(1);

        $queue_log = QueueLog::create([
            'queue_test_id' => $queue_test->id,
            'host'          => \gethostname(),
        ]);

        if(!$queue_log){
            Log::error('Unable to create QueueLog');
        }
    }
}
