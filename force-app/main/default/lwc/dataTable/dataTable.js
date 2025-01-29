import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts'; // Apex method
export default class DataTable extends LightningElement {
    @track accounts; // Holds the account data
    @track columns = [
        { label: 'Name', fieldName: 'Name', sortable: true },
        { label: 'Industry', fieldName: 'Industry', sortable: true },
        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency', sortable: true },
        {
            type: 'action',
            typeAttributes: { rowActions: this.getRowActions } // Add row actions (view/delete)
        }
    ];
    @track sortedBy; // The field by which the table is sorted
    @track sortedDirection = 'asc'; // Sort direction
    // Fetch the accounts using Apex
    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching accounts:', error);
        }
    }
    // Define row actions
    getRowActions(row, doneCallback) {
        const actions = [
            { label: 'View', name: 'view' },
            { label: 'Delete', name: 'delete' }
        ];
        doneCallback(actions);
    }
    // Handle row actions (view/delete)
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'view') {
            this.viewAccount(row);
        } else if (actionName === 'delete') {
            this.deleteAccount(row);
        }
    }
    // View account logic (for example, navigate to record detail page)
    viewAccount(row) {
        console.log('View account:', row.Id);
        // Implement navigation logic if needed
    }
    // Delete account logic
    deleteAccount(row) {
        console.log('Delete account:', row.Id);
        // Implement delete logic (e.g., call Apex method)
    }
    // Handle column sorting
    handleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        this.sortedBy = sortedBy;
        this.sortedDirection = sortDirection;
        this.sortData(sortedBy, sortDirection);
    }
    // Sort the data
    sortData(fieldname, direction) {
        let parseData = JSON.parse(JSON.stringify(this.accounts));
        let keyValue = (a) => {
            return a[fieldname];
        };
        let isReverse = direction === 'asc' ? 1 : -1;
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // Handle undefined values
            y = keyValue(y) ? keyValue(y) : '';
            return isReverse * ((x > y) - (y > x));
        });
        this.accounts = parseData;
    }
}