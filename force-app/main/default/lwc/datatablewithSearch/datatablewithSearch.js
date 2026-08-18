import { LightningElement } from 'lwc';

export default class DatatablewithSearch extends LightningElement {
    searchKey='';
    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Industry', fieldName: 'Industry' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ];
    data = [
        { Id: 1, Name: 'Acme Corporation', Industry: 'Manufacturing', Phone: '(123) 456-7890'},
        { Id: 2, Name: 'Global Industries', Industry: 'Technology', Phone: '(987) 654-3210' },
        { Id: 3, Name: 'Tech Solutions', Industry: 'IT Services', Phone: '(555) 123-4567' },
        { Id:4, Name: 'Innovative Designs', Industry: 'Design', Phone: '(555) 987-6543' },
        { Id:5, Name: 'Green Energy', Industry: 'Renewable Energy', Phone: '(555) 246-8101' },
        { Id:6, Name: 'HealthCare Solutions', Industry: 'Healthcare', Phone: '(555) 369-1212' },
        { Id:7, Name: 'Financial Experts', Industry: 'Finance', Phone: '(555) 789-4561' },
        { Id:8, Name: 'EduTech Innovations', Industry: 'Education Technology', Phone: '(555) 321-9876' },
        { Id:9, Name: 'Travel Adventures', Industry: 'Travel & Tourism', Phone: '(555) 654-3210' }
    ];
    filteredData = this.data;
    handleSearchKeyChange(event){
        this.searchKey = event.target.value.toLowerCase();
        this.filteredData = this.data.filter(record =>
            record.Name?.toLowerCase().includes(this.searchKey)
        );
    }
}