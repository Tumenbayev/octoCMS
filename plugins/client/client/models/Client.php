<?php namespace Client\Client\Models;
use Client\Accounting\Models\Accounting as AccountingModel;
use Model;

/**
 * Client Model
 */
class Client extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'client_client_clients';

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $belongsTo = [];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];

    public function getPriceAttribute() {
        $price = AccountingModel::where('client_id', $this->id)->select('price')->get();
        $totalPrice = 0;
        foreach($price as $p) {
            $totalPrice += $p->price;
        }
        return $totalPrice . ' KZT';
    }
    public function getVisitsAttribute() {
        $total = AccountingModel::where('client_id', $this->id)->count();
        return $total;
    }
}
